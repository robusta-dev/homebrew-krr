class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.3.2/krr-macos-latest-v1.3.2.zip"
        sha256 "38e7bc7a43e525b03d8fa276f97913ae074cf6adb4c1b313f80d523dd78d147a"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.3.2/krr-ubuntu-latest-v1.3.2.zip"
        sha256 "300f0c38948cea371ebc329a67d1801dc78042989471aa9222f49b7aea442071"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
