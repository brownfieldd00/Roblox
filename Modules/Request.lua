local Request = {}

function Request.new(method, url, headers, body)
    local request, meta = {}, {}
    request.method = method
    request.url = url
    request.headers = headers
    request.body = body

    function request:_encodeHeaders()
        return game:GetService('HttpService'):JSONEncode(self.headers)
    end
    function request:setHeader(key, value)
        self.headers[key] = value
        return self
    end
    function request:setBody(new_body)
        self.body = new_body
        return self
    end
    function request:setMethod(new_method)
        self.method = new_method
        return self
    end
    function request:send()
        local res = syn.request({
            Url = self.url,
            Method = self.method,
            Headers = self:_encodeHeaders(),
            Body = self.body
        }).Body
        return {
            status = res.StatusCode or 200,
            body = res.Body,
            headers = res.Headers,
            json = function(self0)
                return game:GetService('HttpService'):JSONDecode(self0.body)
            end
        }
    end

    function meta.__tostring(self)
        return string.format("Request(%s %s)", self.method, self.url)
    end

    return setmetatable(request, meta)
end
return Request