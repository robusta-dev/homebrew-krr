class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.5.1-pre/krr-macos-latest-v1.5.1-pre.zip"
        sha256 "4adc2045a313fba298349703dac3ce479271a401b96876430a49f98469d87103"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.5.1-pre/krr-ubuntu-latest-v1.5.1-pre.zip"
        sha256 "6b9a8ac0909f704e253a23d83f7e8de8d5401d2c02feaa7987bace6457383da3"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
