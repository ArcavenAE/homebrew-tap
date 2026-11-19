class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261119.082809.d22405c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-082809-d22405c/marvel-darwin-arm64"
    sha256 "906034359d28b56bf7a06d3ede4237d6803aa2b8d218206ad22533cbe8d0def1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-082809-d22405c/marvel-darwin-amd64"
    sha256 "8cadc25045eddee383f4c7b3b26d3025e0d4a9b1e6f3ca0f11a2e764e133dca7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-082809-d22405c/marvel-linux-arm64"
    sha256 "f1a80b07431ee5d52cf1f3760f26e9b4701c66f797a3225d254500ff3489e9a4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-082809-d22405c/marvel-linux-amd64"
    sha256 "61e79a1b6695fd1423f8774bc4dcde9b79465b37a5373a903129795c327dcb08"
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
