class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v.1.14.0-alpha1/krr-macos-latest-v.1.14.0-alpha1.zip"
        sha256 "704b5f779bfb52cb9a17a2eb340b3985b64e6e29538e6924e90a4b639e088465"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v.1.14.0-alpha1/krr-ubuntu-latest-v.1.14.0-alpha1.zip"
        sha256 "69981ef5425567deb3916ae0844e9d16b4b86502965941d314c1082757ffae24"
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
  
