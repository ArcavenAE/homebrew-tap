class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260927.181415.757dfb1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260927-181415-757dfb1/marvel-darwin-arm64"
    sha256 "cb6719df3baf0b62a140d2393448cd76c145b08190e03ec99fde2026e355791c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260927-181415-757dfb1/marvel-darwin-amd64"
    sha256 "5295666269f4f442fdab46d0a924c6e82aa57dbf4bfb1edd09210c90c443292c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260927-181415-757dfb1/marvel-linux-arm64"
    sha256 "ffcb3d17260a239d0e0b8212bd176c25bdcef3094b9e86a4aa7dad9a10cf04f3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260927-181415-757dfb1/marvel-linux-amd64"
    sha256 "84b4602702dd2dd0935415c62be7902d23fadbb36b04def06533343e09c7142d"
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
