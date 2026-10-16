class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.193509.8d38fde"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-193509-8d38fde/marvel-darwin-arm64"
    sha256 "00b6ddd42da4220208b18d7e76ab58e0c890b8bce9562b57424e8fd0ae985fa7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-193509-8d38fde/marvel-darwin-amd64"
    sha256 "87723e43711560a545944fec14262068e54f6403ddc0d358c1e3971283e4cfb6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-193509-8d38fde/marvel-linux-arm64"
    sha256 "35931be18acd96cfd4ca479888dfbb7bbcb15d8443d48a0558ce3fe9e386ecd6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-193509-8d38fde/marvel-linux-amd64"
    sha256 "164bac646c8dc84d0caf06efff62dd78916b82209cf9186b27c7d008725de453"
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
