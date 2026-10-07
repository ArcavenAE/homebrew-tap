class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.200430.b521919"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-200430-b521919/marvel-darwin-arm64"
    sha256 "0ca52b97a9389e7071d40ed762502e62004b3ac521eccabdef54397cabf3f345"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-200430-b521919/marvel-darwin-amd64"
    sha256 "6e8d4da3e3df0e6c132e0ae3446219a011c733a6a98183efe47828200239aede"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-200430-b521919/marvel-linux-arm64"
    sha256 "4834ae6011e35c14ca4b6c995316ce396268325978a083bfcac78e4590fa9767"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-200430-b521919/marvel-linux-amd64"
    sha256 "7f965975a615ed77e783aff4af4c7cba41da5ebd37cbdbb67f19fd929a664b57"
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
