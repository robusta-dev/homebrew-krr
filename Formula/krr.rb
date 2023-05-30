class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.2.1-rc1/krr-macos-latest-v1.2.1-rc1.zip"
        sha256 "822eeb8702e2f850a4d1f297843cc4b9c1ad2a605f30c55daa8baf26f9c81f40"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.2.1-rc1/krr-linux-latest-v1.2.1-rc1.zip"
        sha256 "f35ca6a273b5bbaccdbabb70ffdf25419ed9d68de191f675bf9b11d084da1ba0"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
