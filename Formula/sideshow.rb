class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260928.131630.4248117"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-131630-4248117/sideshow-darwin-arm64"
    sha256 "c5d92047ab2325e6e5b0aed0f5e0f712f3bb0c8ae00269352992f2c7949fe619"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-131630-4248117/sideshow-darwin-amd64"
    sha256 "205e8b9d958c41e0f63f9feb732fe57c7b33cc7831ddde977ce9a40cfde55e6f"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-131630-4248117/sideshow-linux-amd64"
    sha256 "85bc13cfbaafa6dadc6d270c5f1d90e001a76c76cba7a0cd69c2851082f20efa"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
