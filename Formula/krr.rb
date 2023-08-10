class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.5.3/krr-macos-latest-v1.5.3.zip"
        sha256 "0c1c1d40df993a41ca25dadd8f40637b8c576a966aa8af9706e064c21c4b9a53"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.5.3/krr-ubuntu-latest-v1.5.3.zip"
        sha256 "128466bbe94e387f02c4a61a60c5d6cf2b4ff327d9672ee2d7e8847acdf98733"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
