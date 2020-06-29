const AWS = require('aws-sdk');

exports.handler = async (event) => {
    console.log(`fn=handler event=${JSON.stringify(event)}`);

    return {
        statusCode: 200,
    };
};
