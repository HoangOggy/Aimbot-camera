local a = "IlsgWyAgICAgRm9sbG93IFBsYXllciBDYW1lcmEgU2NyaXB0CiAgICBVcGdyYWRlZCBVSSBWZXJzaW9uCiAgICBNYWRlIGJ5IOuDqOq3iAogXV0KCg0KLS0gU2VydmljZXMKbG9jYWwgUGxheWVycyA9IGdhbWU6R2V0U2VydmljZSgiUGxheWVycyIpCmxvY2FsIFVzZXJJbnB1dFNlcnZpY2UgPSBnYW1lOkdldFNlcnZpY2UoIlVzZXJJbnB1dFNlcnZpY2UiKQpsb2NhbCBSdW5TZXJ2aWNlID0gZ2FtZTpHZXRTZXJ2aWNlKCJSdW5TZXJ2aWNlIikKbG9jYWwgVHdlZW5TZXJ2aWNlID0gZ2FtZTpHZXRTZXJ2aWNlKCJUd2VlblNlcnZpY2UiKQpsb2NhbCBDYW1lcmEgPSB3b3Jrc3BhY2UuQ3VycmVudENhbWVyYQpsb2NhbCBMb2NhbFBsYXllciA9IFBsYXllcnMuTG9jYWxQbGF5ZXIKCi0tIEdVSSBSb290CmxvY2FsIGd1aSA9IEluc3RhbmNlLm5ldygiU2NyZWVuR3VpIikKZ3VpLk5hbWUgPSAiRm9sbG93UGxheWVyVUkiCmd1aS5SZXNldE9uU3Bhd24gPSBmYWxzZQpndWkuUGFyZW50ID0gZ2FtZTpHZXRTZXJ2aWNlKCJDb3JlR3VpIikKCi0tIE1haW4gRnJhbWUKbG9jYWwgbWFpbiA9IEluc3RhbmNlLm5ldygiRnJhbWUiKQptYWluLlNpemUgPSBVRGltMi5uZXcoMCwgMTgwLCAwLCAxMTApCm1haW4uUG9zaXRpb24gPSBVRGltMi5uZXcoMCwgMzAsIDEsIC0xNTApCm1haW4uQmFja2dyb3VuZENvbG9yMyA9IENvbG9yMy5mcm9tUkdCKDIwLCAyMCwgMjApCm1haW4uUGFyZW50ID0gZ3VpCgpJbnN0YW5jZS5uZXcoIlVJQ29ybmVyIiwgbWFpbikuQ29ybmVyUmFkaXVzID0gVURpbS5uZXcoMCwgMTQpCgo="

local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local function base64decode(data)
    data = data:gsub('[^'..b64chars..'=]', '')
    return (data:gsub('.', function(x)
        if x == '=' then return '' end
        local r,f='',(b64chars:find(x)-1)
        for i=6,1,-1 do
            r = r .. (f%2^i - f%2^(i-1) > 0 and '1' or '0')
        end
        return r
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if #x ~= 8 then return '' end
        local c=0
        for i=1,8 do
            c = c + (x:sub(i,i)=='1' and 2^(8-i) or 0)
        end
        return string.char(c)
    end))
end

local decoded = base64decode(a)
assert(loadstring(decoded))()
