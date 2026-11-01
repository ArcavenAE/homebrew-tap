class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.230341.7e78c8c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-230341-7e78c8c/marvel-darwin-arm64"
    sha256 "59021cdeb10bf37699aec45d5026ddf30d5e9f23b20b200d9b2247247f198f5f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-230341-7e78c8c/marvel-darwin-amd64"
    sha256 "2f2451a530a65dc0c33247b9764de41ec330873c2d3d53481ba5af59c5052c3b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-230341-7e78c8c/marvel-linux-arm64"
    sha256 "5f2c2843e7c8da4928af5382358cf4094a3db75e7d66c1f0293eeaa3f4e339b6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-230341-7e78c8c/marvel-linux-amd64"
    sha256 "d27d7a1abdafeab9d815ffa91f9ea4ca78ff3942da46161ccb6a59839ed8fcc5"
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
