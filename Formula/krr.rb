class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.6.0/krr-macos-latest-v1.6.0.zip"
        sha256 "443c655e865a5154d9c222dc183da56eb9d7f86e03d08d6916d523f5ae647fad"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.6.0/krr-ubuntu-latest-v1.6.0.zip"
        sha256 "7714ab957f0b4e131fabde980e2e83422285f86847ad64ce06ba8c2a9d043afe"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
