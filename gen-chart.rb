CHARS = "a".."z"
NUMS = 1..99

FILE = "temp.md"
# ignore "debian"
DISTRO = ["Linux", "BSD"]
LINUX_DISTRO = ["Ubuntu", "Arch", "Majanro", "Fedora", "openSUSE", "alpine"]
BSD_DISTRO = ["FreeBSD", "OpenBSD", "NetBSD"]
# ignore "arm/v5", "arm/v6", "arm/v7"
ARCH = ["386", "amd64", "armhf", "arm64", "mips64", "mips64le", "ppc64le", "riscv64", "s390x"]

distro_len = LINUX_DISTRO.length() + BSD_DISTRO.length()
arch_len = ARCH.length()
chars_slice = CHARS.to_a[0..distro_len-1]
nums_slice = NUMS.to_a[0..arch_len-1] 

# column
def gen_chart (file, row_data, col_data, corner, center)
    if !file 
        puts "file path must NOT be empty"
        exit 1
    end

    if row_data.kind_of?(Array) 
        if row_data[0].kind_of?(Array)
            r_bool = true
        else
            r_bool = false
        end
    else
        puts "row_data must be a Array"
        exit 2
    end    

    if col_data.kind_of?(Array)
        if col_data[0].kind_of?(Array)
            c_bool = true
        else
            c_bool = false
        end
    else
        puts "col_data must be a Array"
        exit 3
    end

    if !corner
        corner = "Title"
    end

    if center
        hr_append = " :---: |"
    else
        hr_append = " --- |"   
    end

    IO.write(file, "")

    # table operation
    header = "| #{corner} |" 
    hr = "| --- |"
    body_row = 0

    if r_bool
        for r_array in row_data do
            header += " **r_array** |"
            hr += hr_append
            body_row += 1
            for r_item in r_array do
                header += " #{r_item} |"
                hr += hr_append
                body_row += 1
            end
        end
    else
        body_row = 0
        for r_item in row_data do
            header += " #{r_item} |"
            hr += hr_append
            body_row += 1
        end
    end

    header += "\n"
    hr += "\n"
    IO.write(file, header + hr, mode: "a")


    body_col = 0
    if c_bool 
        for i in 0..col_data.length()-1
            IO.write(file, "| **#{DISTRO[i]}** |\n", mode: "a")
            for j in 0..col_data[i].length()-1
                new_line = "| #{col_data[i][j]} |"
                for k in 1..body_row
                    new_line += " [link][#{CHARS.to_a[body_col]}#{k}] |"
                end
                new_line += "\n"
                body_col += 1
                IO.write(file, new_line, mode: "a")
            end
        end
    else
        for l in 0..col_data.length()-1
            new_line = "| #{col_data[l]} |"
            for m in 1..body_row
                new_line += " [link][#{CHARS.to_a[l]}#{m}] |"
            end
            new_line += "\n"
            IO.write(file, new_line, mode: "a")
        end
    end
    IO.write(file, "\n", mode: "a")
end

gen_chart(FILE, ARCH, [LINUX_DISTRO, BSD_DISTRO], "distro \\ arch", true)


for char in chars_slice do
    for num in nums_slice do
        IO.write(FILE, 
            "[#{char}#{num}]: <>\n", 
            mode: "a")
    end
end
