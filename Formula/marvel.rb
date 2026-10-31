class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261031.002404.4efe312"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-002404-4efe312/marvel-darwin-arm64"
    sha256 "36fa55a5c24ab5a25521a3c4f8e08fc58326eae3245a280b19b6a3d2df6e2e52"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-002404-4efe312/marvel-darwin-amd64"
    sha256 "b13f07dd8f24db8a5b16c5c560e49e1a78870cde9d0e487e5fd0b6c51c257a1f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-002404-4efe312/marvel-linux-arm64"
    sha256 "87de3b8b547b3eb8e9c20075b33821237396aacb46fbd3fe43c7ab1c8d4dd00c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-002404-4efe312/marvel-linux-amd64"
    sha256 "8140a7e2156f399bc5ea8d72ab850b5368d9740ce82be7dadf79c91789494d16"
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
