module NRELssc

hello() = print("Hello World adfa!")

ENV["SSC_DIR"]="e:\\projects\\YangSimOpt.jl\\external\\nrelssc\\"

const ssc_location = ENV["SSC_DIR"]

const sscdll = joinpath(ssc_location, "ssc.dll")

function ssc_version()
    ccall((:ssc_version, sscdll), Cint, ())
end

function ssc_build_info()
    ccall((:ssc_build_info, sscdll), Cchar, ())
end

end # module


