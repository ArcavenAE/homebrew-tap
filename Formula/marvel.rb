class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.143424.e979fc2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-143424-e979fc2/marvel-darwin-arm64"
    sha256 "8045f8b4fcf76f56359b4ed3b5792d57fdeac7bd932a23cf86e6ce62bda88b62"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-143424-e979fc2/marvel-darwin-amd64"
    sha256 "643b75c10e6276998dce3a5a095945fda28629ab7874329313db3fe99e4a377d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-143424-e979fc2/marvel-linux-arm64"
    sha256 "b7f26e2498336d579b1eec85411fa2bba452b570bac428d147f5835a2006d7eb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-143424-e979fc2/marvel-linux-amd64"
    sha256 "0f70e8a085ad8585fb3d1b5b69dc75c26714dd59f20f4b18a476a56e40007f7e"
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
