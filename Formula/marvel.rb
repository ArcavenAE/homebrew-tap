class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260731.232249.9f2fd8b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-232249-9f2fd8b/marvel-darwin-arm64"
    sha256 "94fd3174e3761c824d4a3f7d5c334c056740caa3c14e07cf5590180e48cb7f9d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-232249-9f2fd8b/marvel-darwin-amd64"
    sha256 "a993f67f43600cc42f4ee6384993ec01cfe07481e85a929d84a91631ed09c788"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-232249-9f2fd8b/marvel-linux-arm64"
    sha256 "311a90b712957611f4789cb97f5e1ec81e9fa49d3023160b08a31c67cb8b47b0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-232249-9f2fd8b/marvel-linux-amd64"
    sha256 "14ef174d7c571f7c8362381722f4026dc107ea0e7492c22b0621f5486667823a"
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
