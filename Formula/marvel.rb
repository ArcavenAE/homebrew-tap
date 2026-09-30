class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.163046.778f745"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-163046-778f745/marvel-darwin-arm64"
    sha256 "2e48a596e03e4285128aa51bcd5c590d8702c975ad1f753ee6c0f5a315c46fa5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-163046-778f745/marvel-darwin-amd64"
    sha256 "27e7335071309d4a9a077819bef325a72e9cb7cdec0a9d70cbf84a008c4218e2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-163046-778f745/marvel-linux-arm64"
    sha256 "2454d8af046c21b02fbc4b5826f95735a9ea8422baa73f0e23b222c54282a7b7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-163046-778f745/marvel-linux-amd64"
    sha256 "48b44d39796cf76ecb6a887a05549e4df93c05e0176ad22e78d81f3a6ee9ad24"
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
