class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.25.1/krr-macos-latest-v1.25.1.zip"
        sha256 "d792decd380b80e5b197fe330c0923ea3564f0e5a39cb8121954d30ddb71a0b6"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.25.1/krr-ubuntu-latest-v1.25.1.zip"
        sha256 "e75ae712c62f03d04e156defcc844c99642c71d4cb416f87a398b266ff259052"
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
  
