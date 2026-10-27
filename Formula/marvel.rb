class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.183433.0de2175"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-183433-0de2175/marvel-darwin-arm64"
    sha256 "96bc059935d63dc5b365007c2520a975bf63c394ab4636fdaa4061c88991744c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-183433-0de2175/marvel-darwin-amd64"
    sha256 "0073d86940b4b1429cdaee9ba94969c073448e2f56405ce30bf1cbeeb21b0a3e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-183433-0de2175/marvel-linux-arm64"
    sha256 "5ec34603c02012f308af49d056c05af37de2f70325ec38c0d19ef4091615f800"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-183433-0de2175/marvel-linux-amd64"
    sha256 "f6a814fc7b4e0451ef1ef4419b2b4eb94b9b7a708ebcec02e0d6a769a485b388"
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
