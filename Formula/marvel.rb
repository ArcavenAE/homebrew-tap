class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.031953.8f390db"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-031953-8f390db/marvel-darwin-arm64"
    sha256 "854e9db66c3e6d61246d2e241b78c414db33ca462729c35a200a18d125741db6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-031953-8f390db/marvel-darwin-amd64"
    sha256 "f00621e5de4b306fa8541c2169f72ecd68822e7a0de9367a2fd0d209d5fe32e4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-031953-8f390db/marvel-linux-arm64"
    sha256 "3eb2830c72f412d3123bca22c2abc21cb392ad21b64715dbe02578c2569d50db"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-031953-8f390db/marvel-linux-amd64"
    sha256 "dec670d6ebeb28c5c365a78998183d6cd88f229775b5dc05c81348abb17b3449"
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
