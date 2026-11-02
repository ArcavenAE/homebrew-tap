class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.210544.bcf7fb9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-210544-bcf7fb9/marvel-darwin-arm64"
    sha256 "0cc1f420fa454215a0601ca09030ba173bef1b06fc33713489c69823672d266f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-210544-bcf7fb9/marvel-darwin-amd64"
    sha256 "e2338f2c9c6c1ea1cfac9e31601fee88cab1acb170ef74ad79b1b9b4b14fb2d6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-210544-bcf7fb9/marvel-linux-arm64"
    sha256 "1754bc25b9d2561a7d161980de50d9090e5ece942ebe31dc0077155574bba055"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-210544-bcf7fb9/marvel-linux-amd64"
    sha256 "2e35a6d015283dfded5e08b8902b905149bfde8dc308d4136fa654e35554e7d6"
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
