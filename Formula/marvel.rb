class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260419.053014.82e2c0d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-053014-82e2c0d/marvel-darwin-arm64"
    sha256 "d133ec11e9c1215112451bec024193fba2542355b2ba80f6b2f7bc47d564469a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-053014-82e2c0d/marvel-darwin-amd64"
    sha256 "e6efe90af3b0bff19ee72132b01765b6244464d83d7bbedb92ae55cdfbd65c5b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-053014-82e2c0d/marvel-linux-arm64"
    sha256 "5158c5538f43eb319c758557bc3eabc16fb841ea5fbd6cc279ae9c572700501e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-053014-82e2c0d/marvel-linux-amd64"
    sha256 "2e9a88c4fb462c2ddb87d00be68f04e0025792d64837ce1459024ad3fef78f60"
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
