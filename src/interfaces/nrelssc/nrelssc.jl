module NRELssc

hello() = print("Hello World adfa!")

ENV["SSC_DIR"]="e:\\develop\\YangSimOpt.jl\\external\\nrelssc\\"

const ssc_location = ENV["SSC_DIR"]

const sscdll = joinpath(ssc_location, "ssc.dll")

const INVALID = 0
const STRING = 1
const NUMBER = 2
const ARRAY = 3
const MATRIX = 4
const INPUT = 1
const OUTPUT = 2
const INOUT = 3

function ssc_version()
    ccall((:ssc_version, sscdll), Cint, ())
end

function ssc_data_create()
    ccall((:ssc_data_create, sscdll), Ptr{Cvoid}, ())
end

function ssc_build_info()
    build_info = ccall((:ssc_build_info, sscdll), Cstring, ())    
    if build_info == C_NULL
        error("call ssc_build_info error.")
    end
    return unsafe_string(build_info)
end

end # module


