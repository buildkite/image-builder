const AWS = require('aws-sdk');

exports.handler = async (event) => {
    console.log(`fn=handler event=${JSON.stringify(event)}`);

    for (const record of event.Records) {
        let message = JSON.parse(record.Sns.Message);
        if (!message.state || message.state.status != "AVAILABLE") {
          return;
        }

        for (const ami of message.outputResources.amis) {
          let image = ami.image;

          /*
            Update the SSM Parameter and notify the SNS topic.
          */

          let ssmParameter = process.env.OUTPUT_PARAMETER;
          if (ssmParameter != undefined) {
            console.log(`fn=handler at=ssm name=${ssmParameter} value=${image}`);
            let ssm = new AWS.SSM({apiVersion: '2014-11-06'});
            let ssmResult = await ssm.putParameter({
              Name: ssmParameter,
              Type: 'String',
              Value: image,
              Overwrite: true,
            }).promise();
            console.log(`fn=handler at=ssm ssmResult=${JSON.stringify(ssmResult)}`)
          }

          let topicArn = process.env.OUTPUT_TOPIC;
          if (topicArn != undefined) {
            console.log(`fn=handler at=sns`);
            let sns = new AWS.SNS({apiVersion: '2010-03-31'});
            // SNS Topic ARN
            let snsResult = await sns.publish({
              Message: JSON.stringify({event: "NewImage", NewImage: {ami: image}}),
              TopicArn: topicArn,
            }).promise();
            console.log(`fn=handler at=sns snsResult=${JSON.stringify(snsResult)}`);
          }
        };
    };

    return {
        statusCode: 200,
    };
};
