class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.070105.1c7a2e5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070105-1c7a2e5/marvel-darwin-arm64"
    sha256 "69067713fcf05544fec98b65132758b5c950614dde81213cf968f4dab4eba3e4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070105-1c7a2e5/marvel-darwin-amd64"
    sha256 "aac826592c6fde3abbba2566aa1a6d3c50d19afe97ea453b0b079a5722a77470"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070105-1c7a2e5/marvel-linux-arm64"
    sha256 "9df38be14de1ebd25231622ff8281cf1e1d5816b04f8fa235b942a327a51ee53"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-070105-1c7a2e5/marvel-linux-amd64"
    sha256 "d5d575c5c2873ab94775c0a47539c2726d4acd779ff4d3807b438bf6ba19de2b"
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
