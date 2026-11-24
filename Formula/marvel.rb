class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261124.154033.ac78587"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-154033-ac78587/marvel-darwin-arm64"
    sha256 "4a385ae2dc2fcc060bc149c7291090b26c4903224bf03105011934f0715d8e22"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-154033-ac78587/marvel-darwin-amd64"
    sha256 "f758e763c2e9807092f7711a4f82b9048c436cda8ff47ce78b4922e2b968ac95"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-154033-ac78587/marvel-linux-arm64"
    sha256 "11e64a6214034f846d22bd0256863e6c5c50916fcb481fcb6983b9e3dd0b3d90"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-154033-ac78587/marvel-linux-amd64"
    sha256 "b66103f57feb99ebfc2ab14dc682ecca0aecc2451b9a82b9d0867b41b1cd0e8e"
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
