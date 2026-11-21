class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261121.201958.f0d504f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-201958-f0d504f/marvel-darwin-arm64"
    sha256 "390187dcd79f94fcae2d4c05eabc4f947a307b8df6cf5d75c01c55a735c25bc9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-201958-f0d504f/marvel-darwin-amd64"
    sha256 "05728af12ad7994119ffac6d63da8f7e6aaad9cebb4ac9eaa55ca9227cecaf1b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-201958-f0d504f/marvel-linux-arm64"
    sha256 "f11dec8b268f42d76733ff848810cfeb3477ce87670bf456168018f98ac26d7b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-201958-f0d504f/marvel-linux-amd64"
    sha256 "0f8c255bbe138652572a414b5c7289b252a365e50f505defa69103c55aa049a3"
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
