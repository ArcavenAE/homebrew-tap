class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260912.180032.e13106f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-180032-e13106f/marvel-darwin-arm64"
    sha256 "8bf933f6120038d7c7785caeee22afd60574352bb276cdbda3e753934a916050"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-180032-e13106f/marvel-darwin-amd64"
    sha256 "ed44ee8bbd9c79fdda6bac1413c819b9793faeb798a05a9dda65b0f1beda7e51"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-180032-e13106f/marvel-linux-arm64"
    sha256 "5b1a0726331cb751cc36f52b8a3d7333ac433faeab01fbfe8396f01c7d427637"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-180032-e13106f/marvel-linux-amd64"
    sha256 "64320038684b04c067463a789dc4a77f46d2ca92248d2f1345425ebc9182926b"
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
