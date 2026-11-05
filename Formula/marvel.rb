class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.194542.ba0ea65"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-194542-ba0ea65/marvel-darwin-arm64"
    sha256 "fc51dd5de59f37c9d5f4a9afcedcb89a1092b1daa22c14c7754af04a9fcd8db0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-194542-ba0ea65/marvel-darwin-amd64"
    sha256 "aae0792ba0e72c205cf8f013ce9729a47f1ff6dbd126c3c4f7eac7f68b00c639"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-194542-ba0ea65/marvel-linux-arm64"
    sha256 "fcf923c7c94f70b095a073467d18606a542376da0697bb8398bf10df2b6d30cb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-194542-ba0ea65/marvel-linux-amd64"
    sha256 "4053cc05890851e39e4b24cfe81fff2204a647747de2ccb665ef7b8dee9c2645"
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
