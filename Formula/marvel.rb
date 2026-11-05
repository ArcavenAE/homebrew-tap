class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.023310.1108573"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-023310-1108573/marvel-darwin-arm64"
    sha256 "c89213162f0ec2ec4b4ca209991df02589bfefbeb15051471f04f535f2e016c7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-023310-1108573/marvel-darwin-amd64"
    sha256 "714895a57941d18a4c427fe5a7e512eabbad84f62ee60435b0569c8e2b9c211b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-023310-1108573/marvel-linux-arm64"
    sha256 "74ecb5c973fc26d84b24fb350e0fd03fd294f0baf28997554629a16961f7046c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-023310-1108573/marvel-linux-amd64"
    sha256 "d6d31d2ec1012f95e9110f50f18752337e22a6709151848441dc6dbb10e03f11"
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
