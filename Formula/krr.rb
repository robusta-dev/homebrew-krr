class Krr < Formula
    desc "Kubernetes Resource Recommender by Robusta"
    homepage "https://github.com/robusta-dev/krr"
  
    if OS.mac?
        url "https://github.com/robusta-dev/krr/releases/download/v1.27.0/krr-macos-latest-v1.27.0.zip"
        sha256 "f54cbf06beeee4509ac31fd1aa28e2e8c32d3deb18eefc3970ae4ab4f918337d"
    elsif OS.linux?
        url "https://github.com/robusta-dev/krr/releases/download/v1.27.0/krr-ubuntu-latest-v1.27.0.zip"
        sha256 "03cc5836efcddaa8ba95af07ac0949c23c3f57e85c097531c97351b729bb75f9"
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
  
