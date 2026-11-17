class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261117.032005.182fadf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-032005-182fadf/marvel-darwin-arm64"
    sha256 "d9976fb8eb0cd951b4a2d28dcd01cd5ee6e16b60a8ce8f6ff89f00998f1a5b04"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-032005-182fadf/marvel-darwin-amd64"
    sha256 "3e7c50bc4270278e55bf86f58fe3185595948046dcb26e565979e4345ed4d2f6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-032005-182fadf/marvel-linux-arm64"
    sha256 "b37b892996ab2aaf6698939d306c97b716d3494cf1cbeb75861ad595e5dd843d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-032005-182fadf/marvel-linux-amd64"
    sha256 "77eb5b7e85ec0d9ca5d2eabce2487d95839324f38029ed5d591da9c43651b59e"
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
