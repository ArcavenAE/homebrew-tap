class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260914.190304.70a31fe"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-190304-70a31fe/marvel-darwin-arm64"
    sha256 "430ad9dff6b27b962d403d3832353a06409e69e6b69e68b87fe89586a4a3f468"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-190304-70a31fe/marvel-darwin-amd64"
    sha256 "a412ad299587a6677460105fb4447e5afb2ff3cb78a4ebacbce84407bef95df0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-190304-70a31fe/marvel-linux-arm64"
    sha256 "454f4a68050c3c409a7999471ec1eff2bb7d943858c515de2dcbf58b23cab629"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-190304-70a31fe/marvel-linux-amd64"
    sha256 "45509795fef13631e79ce0cc111c2899824884fbee4e8ae3d889d32c9f1f2423"
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
