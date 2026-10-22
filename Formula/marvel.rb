class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.191212.6f28a0e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191212-6f28a0e/marvel-darwin-arm64"
    sha256 "daf1f66d7ad63f943214fbe3ce3cea6bcb993f2e4dc72deb8f21fb6cb174b485"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191212-6f28a0e/marvel-darwin-amd64"
    sha256 "7d9d201ee9c08ba9cb68ccb3808b14b1f1ff95eb4674d763481361aaaf473c49"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191212-6f28a0e/marvel-linux-arm64"
    sha256 "0666aaedef93157fd3da1c8ccf7618706a0db28d206d4c228096472bca4f553c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191212-6f28a0e/marvel-linux-amd64"
    sha256 "360cd4bd50ab557f98afcb9f0eade185f5da7ef50db1c18716319b0a96c73909"
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
