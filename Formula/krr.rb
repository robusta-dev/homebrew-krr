class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.7.1/krr-macos-latest-v1.7.1.zip"
        sha256 "06c749536374994af08f8b96a6bf3dbdcea4473628cfd40b281f15ce90c67f94"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.7.1/krr-ubuntu-latest-v1.7.1.zip"
        sha256 "d09a0a5c4380a2b206b972c262265fc3c8a1ce62b2b470c4b3db3b29646540af"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
