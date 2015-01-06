local http=require("socket.http");
--21450000是你的学号,7e79ada0efb13b是md5加密以后的密码，当然放明问密码也可以
local request_body = [[username=21450000&password=7e79ada0efb13b&drop=0&type=1&n=100]]
local response_body = {}

local res, code, response_headers = http.request{
    url = "http://192.0.0.6/cgi-bin/do_login",
    method = "POST",
    headers =
      {
          ["Content-Type"] = "application/x-www-form-urlencoded";
          ["Content-Length"] = #request_body;
      },
      source = ltn12.source.string(request_body),
      sink = ltn12.sink.table(response_body),

}

print(res)
print(code)

if type(response_headers) == "table" then
  for k, v in pairs(response_headers) do
    print(k, v)
  end
end

print("Response body:")
if type(response_body) == "table" then
  print(table.concat(response_body))
else
  print("Not a table:", type(response_body))
end