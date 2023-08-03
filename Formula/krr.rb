class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.5.0-pre1/krr-macos-latest-v1.5.0-pre1.zip"
        sha256 "dd945d0b13c9d3b1bf5c59113f797fc56490dea2c12cfcd99b0493917c7530d7"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.5.0-pre1/krr-ubuntu-latest-v1.5.0-pre1.zip"
        sha256 "18e90fdab29e5cfa05b2699b46641cff614442147f19c4c8029e1c096bb3a6e0"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
