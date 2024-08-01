class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.13.0/krr-macos-latest-v1.13.0.zip"
        sha256 "3a2e71144b0302783e8005a76498c40adb8e8fea8be9644c2484d9f8b7d4491c"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.13.0/krr-ubuntu-latest-v1.13.0.zip"
        sha256 "ee8dfd0ed53799c65502a7ac5914d7f8b5c31592be73bba7090ebf2c227af071"
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
  
