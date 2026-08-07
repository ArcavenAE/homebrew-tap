class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.085044.1784c2b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-085044-1784c2b/marvel-darwin-arm64"
    sha256 "e70a297be2a2b3a3920b099399552437d53a1e45e747cd95cfd44195476fbc3f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-085044-1784c2b/marvel-darwin-amd64"
    sha256 "3828c184247adf1d3a1bb3d6cef36ac04ece76b492815ad8e819b76df63c476f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-085044-1784c2b/marvel-linux-arm64"
    sha256 "6796439f014cb4cebd1b4d2ffc486ea3db5d79368bf3ee88e8974ea8e2d3e284"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-085044-1784c2b/marvel-linux-amd64"
    sha256 "7ae33332644bc84e57aa51baf8b03b45b13e0de99c49e2a251989a7fe87c34e0"
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
