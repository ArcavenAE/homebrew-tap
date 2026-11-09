class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.151526.088a1f3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-151526-088a1f3/marvel-darwin-arm64"
    sha256 "b28c443f20cb50fc84be5216f1e8053262f85e8e1c7fbf520b9fce0c77b28e26"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-151526-088a1f3/marvel-darwin-amd64"
    sha256 "2808d3fde75bc4d46cf8b3d0b490a14fd7c518321aad131b816ee93e5a58ee22"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-151526-088a1f3/marvel-linux-arm64"
    sha256 "57e62e535f20538278edf0944521266fa55afc277597de39d2741a73e4176c1d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-151526-088a1f3/marvel-linux-amd64"
    sha256 "a45ba47c51869b6efa53878eb3302aadaf386191c4ef00154ceb4aaf4e754994"
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
