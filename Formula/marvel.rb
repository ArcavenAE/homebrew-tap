class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.110652.76cd695"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-110652-76cd695/marvel-darwin-arm64"
    sha256 "ece80e7d90f60aac63e2e58b9d8e175bf9f293ff4c67ca32c6efd00ffbc3042b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-110652-76cd695/marvel-darwin-amd64"
    sha256 "2de6a939ede9b338e7c48ca0ffdf4aa82717abeb78c3a53a2ff40fb59dc7f47a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-110652-76cd695/marvel-linux-arm64"
    sha256 "1331199960b3206e84b626277d480572e7d48d6fddcc71daeea41f6a4ec949dd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-110652-76cd695/marvel-linux-amd64"
    sha256 "3f14785d7ff4a0904fb26cc9b5bcbd1d4c30e6919bd9879d4b6420e9f19c3e92"
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
