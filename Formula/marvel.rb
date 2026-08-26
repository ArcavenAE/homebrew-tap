class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260826.040502.0d8c69c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040502-0d8c69c/marvel-darwin-arm64"
    sha256 "6ea3f750dfe8eec5a6f9ad713ac2e85932c5994c67445f6bf7007520c7c2622d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040502-0d8c69c/marvel-darwin-amd64"
    sha256 "0332a56173513a9a63e430a97c68f51e94462cc79661c79c4f4e9f1beee3eba0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040502-0d8c69c/marvel-linux-arm64"
    sha256 "6bcdf8f312ecc5db74753fc5f8b96f18b9f4b8373137d6c3b8441c1b8f74d98a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040502-0d8c69c/marvel-linux-amd64"
    sha256 "f5c6d7a07de37ad7c7b05375c3a1e3ec22e7443c9506f0c845b83f139ef45e6b"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
