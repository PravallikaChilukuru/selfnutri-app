/**
 * AWS Lambda Handler for Selfnutri
 * Supports:
 *   GET  /health
 *   GET  /logs
 *   POST /save
 */

const createResponse = (statusCode, body) => {
    return {
        statusCode,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
            "Access-Control-Allow-Headers": "Content-Type, Authorization",
            "Content-Type": "application/json"
        },
        body: JSON.stringify(body)
    };
};

exports.handler = async (event) => {
    console.log("Event:", JSON.stringify(event));

    // Handle OPTIONS preflight
    if (event.httpMethod === "OPTIONS") {
        return createResponse(200, {});
    }

    // GET /health
    if (event.path === "/health" && event.httpMethod === "GET") {
        return createResponse(200, {
            status: "OK",
            service: "Selfnutri Tiny Compute (AWS Lambda)",
            message: "App is healthy and running.",
            invocation_time: new Date().toISOString()
        });
    }

    // GET /logs
    if (event.path === "/logs" && event.httpMethod === "GET") {
        return createResponse(200, {
            logs: [
                "User 1 – Breakfast: 400 calories",
                "User 2 – Lunch: 550 calories",
                "System OK"
            ]
        });
    }

    // POST /save
    if (event.path === "/save" && event.httpMethod === "POST") {
        const body = JSON.parse(event.body || "{}");

        return createResponse(200, {
            message: "Data saved successfully.",
            saved: body,
            timestamp: new Date().toISOString()
        });
    }

    // Default
    return createResponse(404, { error: "Not Found" });
};
