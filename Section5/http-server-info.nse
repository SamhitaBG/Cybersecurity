description = "Get basic HTTP info"

portrule = function(host, port)
    return port.number == 80 or port.number == 8080
end

action = function(host, port)
    local http = require "http"
    local res = http.get(host, port, "/")

    if not res then
        return "No response"
    end

    local status = res.status
    local server = res.header["server"]
    local title = res.body:match("<title>(.-)</title>")

    return "Status: " .. status ..
           "\nServer: " .. (server or "None") ..
           "\nTitle: " .. (title or "None")
end
