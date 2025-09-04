class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.26.2/krr-macos-latest-v1.26.2.zip"
        sha256 "cb9361a1a71b3ecfa6f077b79171afc34c27cf7bb71859cbea1e412bc8dd1f01"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.26.2/krr-ubuntu-latest-v1.26.2.zip"
        sha256 "1d5c6951d21862c3f7461346a278c5805501cc7b73b58d0960a4b4d966352900"
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
  
