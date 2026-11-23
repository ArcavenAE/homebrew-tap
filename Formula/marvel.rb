class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.075303.7fa1e89"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-075303-7fa1e89/marvel-darwin-arm64"
    sha256 "39b5c65716d7fa9e6ec685c7b48e4e14c1da03aff1f9fea3145f4590a7deb3d8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-075303-7fa1e89/marvel-darwin-amd64"
    sha256 "5e26375c3b50242efe37653dec3ddf21fc48a7b7e6f252fcdf5990814b2dd1fa"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-075303-7fa1e89/marvel-linux-arm64"
    sha256 "334934f65ff8ad83c9cac4d1640f6fb7161b11a266b75fb81cbeaf06363c8d93"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-075303-7fa1e89/marvel-linux-amd64"
    sha256 "e09a442d3099883e7708de7efdb3c34786df8f06a644c1b8935dcd2260c4cf77"
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
