class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261013.225722.5fbaea3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-225722-5fbaea3/marvel-darwin-arm64"
    sha256 "e4589791c4d63b3265c55612c0b776d65597c3ce8700d71eee36c9b118edd4a7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-225722-5fbaea3/marvel-darwin-amd64"
    sha256 "3e1fb5fc47d04fb8ed984276d330569841c0f9687036cf6d47ae8574a39f567e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-225722-5fbaea3/marvel-linux-arm64"
    sha256 "7bee6bc444e13003ee10242720f4d386566ec2cda9e36d1ee6609d0ae62ccd98"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-225722-5fbaea3/marvel-linux-amd64"
    sha256 "42400ad678ef7154c361ea49b2d4347541b6000d59b03bd9a2101da6872dffdf"
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
