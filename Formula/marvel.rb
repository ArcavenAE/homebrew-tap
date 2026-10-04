class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.183427.3683620"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-183427-3683620/marvel-darwin-arm64"
    sha256 "465e18afd3d91840277693519ec855fdedac1e146f25d421490633ed1d6644d8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-183427-3683620/marvel-darwin-amd64"
    sha256 "07ae8692e2bab89c83dc3e98b60b6e3434f6f9a06f4556d40f401f7fab6b38fc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-183427-3683620/marvel-linux-arm64"
    sha256 "f2f984b57e0f97df70a3cbb688446548efda17d867ecacb8e7bfd62264f5cfc9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-183427-3683620/marvel-linux-amd64"
    sha256 "6ec04ce2d23bf11bc67ed103530ec3a73df635a946ce5fc4e4d4f74cef158f46"
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
