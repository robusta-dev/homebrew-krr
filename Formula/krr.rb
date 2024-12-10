class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.18.0/krr-macos-latest-v1.18.0.zip"
        sha256 "ab6d9158883e13cfc8426654b19f61224a170f908325c74fcfc250b7119cff5a"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.18.0/krr-ubuntu-latest-v1.18.0.zip"
        sha256 "16a593655736a87e481ed0918d4af6e9fc5f0af8ab6bf0a81b45c016ea72369f"
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
  
