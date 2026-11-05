class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.030750.35b29e9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-030750-35b29e9/marvel-darwin-arm64"
    sha256 "7480734073517ce5e206698800c22410d6d34bc444a8f71fa46e5dfe101ddd3d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-030750-35b29e9/marvel-darwin-amd64"
    sha256 "a5132499447889574ec0bbf8ffd14c8e7e9cf1ddfa0bed6da8429cc9716d7596"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-030750-35b29e9/marvel-linux-arm64"
    sha256 "a64edf86ed0acff52f9aaf7942829374109cd3f29cc419cacda69f5cd7521ab7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-030750-35b29e9/marvel-linux-amd64"
    sha256 "87d1ab4b82379a000bb0a1b1ccf7ace19fda1cf88d7e89e4c951a8386b28670e"
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
