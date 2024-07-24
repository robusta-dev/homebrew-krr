class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v.1.12.0/krr-macos-latest-v.1.12.0.zip"
        sha256 "0dd8a09ce73a9567c444da650bc70fcdb593c0c262700b8617d8be645cc62c2b"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v.1.12.0/krr-ubuntu-latest-v.1.12.0.zip"
        sha256 "3eacd060dcc6584130defad57a862068924fe6ae455a19365d3d93a68ebb7e13"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"krr")
        # our binaries are built with pyinstaller and the first executable run is very slow because it unzips packages
        # to work around that, we "warm up" the binary here during installation so it is fast when the user runs it for the first timeo
        ohai "Running 'krr version' to warm up binary and extract compressed python libraries... this can take up to 60 seconds"
        system libexec/"krr", "version"
    end
    
    test do
        system "#{bin}/krr", "version"
    end
end
  
