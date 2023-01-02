local File = {}
function File.new(path)
    if isfile(path) then return false end
    writefile(path, '')
    local file = {}
    file.path = path
    file.content = ''
    function file:writeToFile()
        writefile(self.content)
        return true
    end
    function file:append(txt)
        self.content = self.content .. tostring(txt)
        return true
    end
    function file:setContent(content)
        self.content = content
        return self
    end
    return file
end
function File.open(path)
    if not isfile(path) then return nil end
    return readfile(path)
end
File.new('test.txt'):setContent('Hello, world!'):writeToFile()
return File